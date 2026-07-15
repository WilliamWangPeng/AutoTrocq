(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_042.
Definition enc_42 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_42 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_42 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_42 : forall o : option nat, dec_42 (enc_42 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_42 : forall o : option nat, enc_42 o = size_42 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_42 : forall o : option nat, enc_42 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_042.

