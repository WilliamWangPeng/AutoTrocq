(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_003.
Definition enc_3 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_3 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_3 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_3 : forall o : option nat, dec_3 (enc_3 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_3 : forall o : option nat, enc_3 o = size_3 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_3 : forall o : option nat, enc_3 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_003.

