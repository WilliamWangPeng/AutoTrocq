(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_067.
Definition enc_67 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_67 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_67 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_67 : forall o : option nat, dec_67 (enc_67 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_67 : forall o : option nat, enc_67 o = size_67 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_67 : forall o : option nat, enc_67 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_067.

