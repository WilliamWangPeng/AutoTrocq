(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_048.
Definition enc_48 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_48 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_48 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_48 : forall o : option nat, dec_48 (enc_48 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_48 : forall o : option nat, enc_48 o = size_48 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_48 : forall o : option nat, enc_48 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_048.

